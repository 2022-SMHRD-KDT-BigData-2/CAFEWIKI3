package Pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CouponDAO;
import Model.CouponVO;
import Model.MemberDAO;
import Model.MemberVO;

public class CouponManageCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		String o_num = vo.getO_num();

		int u_num = Integer.parseInt(request.getParameter("u_num"));

		MemberDAO dao = new MemberDAO();
		MemberVO vo2 = dao.scan(u_num);
		String id = vo2.getId();

		CouponDAO sdao = new CouponDAO();
		CouponVO vo3 = new CouponVO(id, o_num);
		CouponVO svo = sdao.scan(vo3);
		if (svo == null) {
			int cnt = sdao.add(vo3);
			if (cnt > 0) {
				svo = sdao.scan(vo3);

			}

		}
		request.setAttribute("svo", svo);
		return "CouponManage.jsp";

	}
}
