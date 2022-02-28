package org.kh.hw.common;

import org.kh.hw.reservation.domain.PageInfo;

public class WithResPagination {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		
		int resLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		boolean prev, next;
		maxPage = (int)((double)totalCount/resLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit +1;
		endNavi = startNavi + naviLimit -1;
		prev = startNavi > 1;
		next = endNavi < maxPage; 
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, resLimit, 
				naviLimit, startNavi, endNavi, totalCount, maxPage, prev, next);
		return pi;
	}
}
