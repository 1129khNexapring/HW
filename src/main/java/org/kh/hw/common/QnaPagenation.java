package org.kh.hw.common;

import org.kh.hw.qna.domain.PageInfo;

public class QnaPagenation {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		
		int qnaLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		boolean prev, next;
		// 23 /5 = 4.8  + 0.9 = 5.7 => 5
		maxPage = (int)((double)totalCount/qnaLimit + 0.9);
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
		pi = new PageInfo(currentPage, qnaLimit, 
				naviLimit, startNavi, endNavi, totalCount, maxPage, prev, next);
		return pi;
	}
		
}
