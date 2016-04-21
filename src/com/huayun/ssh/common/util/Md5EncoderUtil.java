package com.huayun.ssh.common.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import org.springframework.util.StringUtils;

/**
 *MD5加密工具
 */
public class Md5EncoderUtil{

    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    private final static String encodingAlgorithm = "MD5";

    private final static  String characterEncoding = "UTF-8";

    public Md5EncoderUtil() {
    }

    public static String encode(final String password) {
        if (password == null) {
            return null;
        }

        try {
            MessageDigest messageDigest = MessageDigest.getInstance(encodingAlgorithm);

            if (StringUtils.hasText(characterEncoding)) {
                messageDigest.update(password.getBytes(characterEncoding));
            } else {
                messageDigest.update(password.getBytes());
            }


            final byte[] digest = messageDigest.digest();

            return getFormattedText(digest);
        } catch (final NoSuchAlgorithmException e) {
            throw new SecurityException(e);
        } catch (final UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Takes the raw bytes from the digest and formats them correct.
     * 
     * @param bytes the raw bytes from the digest.
     * @return the formatted bytes.
     */
    public static  String getFormattedText(byte[] bytes) {
        final StringBuilder buf = new StringBuilder(bytes.length * 2);
        for (int j = 0; j < bytes.length; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }
    
    public static void main(String[] args) {
		System.out.println(encode("admin"));
	}
}
