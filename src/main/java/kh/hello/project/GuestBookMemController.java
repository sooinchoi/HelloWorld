package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.GuestBookDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.services.GuestBookService;
import kh.hello.services.MemberService;
import kh.hello.utils.Utils;

@Controller
@RequestMapping("/GuestBook")
public class GuestBookMemController {
	
	@Autowired
	private GuestBookService gs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/insert.do")
	public String writeProcinsert(GuestBookDTO gdto, String other) {
		try {
			LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
			gdto.setWriterID(loginInfo.getId());
			gdto.setWriter(loginInfo.getNickName());
			gdto.setWriterImg(ms.selectMember(loginInfo.getId()).getProfileImg());
			if(other.contentEquals("Y")) {
				OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("otherInfo");
				gdto.setOwnerID(ownerInfo.getId());
				gdto.setOwner(ownerInfo.getNickName());
				gdto.setContent(Utils.protectXss(gdto.getContent()));
				gs.insert(gdto);
				return "redirect:toGuestSelectList.do";
			}else {
				OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
				gdto.setOwnerID(ownerInfo.getId());
				gdto.setOwner(ownerInfo.getNickName());
				gdto.setContent(Utils.protectXss(gdto.getContent()));
				gs.insert(gdto);
				return "redirect:toSelectList.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
		
	}
	
	@RequestMapping("/toSelectList.do")
	public String selectList(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;
			if(cpage==null) {
				cpage="1";
			}else {
				currentPage = Integer.parseInt(cpage);
			}
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<GuestBookDTO> list = gs.selectListByPage(ownerID,start,end);
			List<String> pageNavi = gs.getGuestBookPageNavi(ownerID, currentPage,"N");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("list", list);
			request.setAttribute("pageNavi", pageNavi);
			return "plog/guestBook";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/toGuestSelectList.do")
	public String guestSelectList(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("otherInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;
			if(cpage==null) {
				cpage="1";
			}else {
				currentPage = Integer.parseInt(cpage);
			}
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<GuestBookDTO> list = gs.selectListByPage(ownerID,start,end);
			List<String> pageNavi = gs.getGuestBookPageNavi(ownerID, currentPage,"Y");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("list", list);
			request.setAttribute("pageNavi", pageNavi);
			return "plog/guestGuestBook";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("guestDelete.do")
	public String guestGuestBookdeleteProc(int seq,String cpage) {
		try {
			gs.delete(seq);
			return "redirect:toGuestSelectList.do?cpage=" + cpage;
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("delete.do")
	public String guestBookdeleteProc(int seq,String cpage) {
		try {
			gs.delete(seq);
			return "redirect:toSelectList.do?cpage=" + cpage;
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public void update(GuestBookDTO gdto) {
		gs.update(gdto);
	}
	
	
	
	
}
