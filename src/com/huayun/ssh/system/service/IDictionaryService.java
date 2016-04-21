package com.huayun.ssh.system.service;

import java.util.List;

import com.huayun.ssh.system.model.Dictionary;

public interface IDictionaryService {

	List<Dictionary> getByType(String dictType);

}
