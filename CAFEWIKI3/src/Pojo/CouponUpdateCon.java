package Pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CouponDAO;
import Model.CouponVO;
import Model.MemberDAO;
import Model.MemberVO;

public class CouponUpdateCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		String o_num = vo.getO_num();
		String id = request.getParameter("id");
		String update= request.getParameter("update");
		int stamp = Integer.parseInt(request.getParameter("stamp"));
		
		if(update.equals("minus")){
			stamp = -stamp;
		}
		
		CouponVO cvo = new CouponVO(id, stamp, o_num);
		CouponDAO dao = new CouponDAO();
		int cnt = dao.update(cvo);
		
		if(cnt>0) {
			System.out.println("update success");
		}

		
		
		return "redirect:cafe.do";
	}

}
