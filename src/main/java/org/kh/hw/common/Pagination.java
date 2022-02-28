package org.kh.hw.common;

import org.kh.hw.notice.domain.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		
		int noticeLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		boolean prev, next;
		// 23 /5 = 4.8  + 0.9 = 5.7 => 5
		maxPage = (int)((double)totalCount/noticeLimit + 0.9);
		// currentPage 1 ->  1 2 3 4 5
		// currentPage 6 -> 6 7 8 9 10
		// currentPage 11- > 11 12 13 14 15
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit +1;
		endNavi = startNavi + naviLimit -1;
		prev = startNavi > 1;
		next = endNavi < maxPage; 
		if(maxPage < endNavi) {
			endNavi = maxPage;
			
		}
		pi = new PageInfo(currentPage, noticeLimit, 
				naviLimit, startNavi, endNavi, totalCount, maxPage, prev, next);
		return pi;
	}
		
}
