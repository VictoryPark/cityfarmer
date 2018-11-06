package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryComment;
import com.cityfarmer.repository.domain.gallery.GalleryFile;
import com.cityfarmer.repository.domain.gallery.RecVO;


public interface GalleryMapper {
	List<GalleryBoard> selectGalleryBoard(GalleryBoard galleryboard); // 리스트
	
	int seLectGalleryBoardCount();//전체 개시물 수
	
	GalleryBoard selectGalleryBoardByNo(int no); //상세
	
	void GalleryDeleteBoard(int no); // 게시글 삭제
	
	void GalleryUpdateBoard(GalleryBoard galleryboard); //업데이트 
	
	int insertGalleryBoard(GalleryBoard galleryboard); //게시글 등록
	
	void insertGalleryFile(GalleryFile file);//파일 등록

	GalleryFile selectFileByGaNo(int gaNo);
	
	int GalleryBoardView(int no);
	
	//-------------------------------------
	void insertComment(GalleryComment comment);
	
	List<GalleryComment> selectCommentListByGaNo(int gaNo);
	
	void deleteComment(int gacNo);

	//----------------------------------추천
	
	int rec(int gaNo); // 게시글 추천수
	int recCount(RecVO recVO); // 게시글 추천여부 확인
	void insertRec(RecVO recVO); //게시글 추천
	void updateRec(int gaNo); //게시글 총 추천수 증가
	void deleteRec(RecVO recVO); //게시글 추천 취소
	void cancelRec(int gaNo);  // 게시글 총 추천수 감소
	
}
