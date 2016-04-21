package com.huayun.ssh.story.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.controller.BaseController;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.story.model.Comment;
import com.huayun.ssh.story.model.Section;
import com.huayun.ssh.story.model.Story;
import com.huayun.ssh.story.service.ICommentService;
import com.huayun.ssh.story.service.ISectionService;
import com.huayun.ssh.story.service.IStoryService;
@Controller
@RequestMapping("story/comment")
@SessionAttributes("LOGINER")
public class CommentController extends BaseController{
	@Autowired
	private ICommentService commentService;
	@Autowired
	private ISectionService sectionService;
	@Autowired
	private IStoryService storyService;
	
	/**
	 * 构造方法
	 */
	public CommentController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/comment_list";
	}
	@RequestMapping(value = "search")
	public String search(){
		
		return "bootstrap/jsp/story/comment_search";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<Comment> valueList = commentService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/story/comment_add";
		}
		@RequestMapping(value = "deleteComment",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteComment(String id){
			commentService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(Comment comment,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			comment.setStatus(1);
			comment.setState(0);
			comment.setCreateTime(new Date());
			comment.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			commentService.save(comment);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "comment",method=RequestMethod.POST)
		public @ResponseBody JSONObject comment(String storyId,String comment,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			Comment comment2 = new Comment();
			comment2.setStatus(1);
			comment2.setState(0);
			comment2.setCreateTime(new Date());
			comment2.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			comment2.setContent(comment);
			Story story = storyService.getById(storyId);
			comment2.setStory(story);
			commentService.save(comment2);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			Comment comment = commentService.getById(id);
			map.put("comment", comment);
			return "bootstrap/jsp/story/comment_edit";
		}
		
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(Comment Comment,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			Comment.setReplayUser(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			Comment.setReplayTime(new Date());
			commentService.edit(Comment);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "jinhuaRecord",method=RequestMethod.POST)
		public @ResponseBody JSONObject jinhuaRecord(String id){
			Comment comment = commentService.getById(id);
			comment.setState(1);
			commentService.edit(comment);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
