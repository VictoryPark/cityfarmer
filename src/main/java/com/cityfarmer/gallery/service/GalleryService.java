package com.cityfarmer.gallery.service;

import java.util.List;
import java.util.Map;

import com.cityfarmer.repository.domain.exchange.SearchVO;
import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryComment;
import com.cityfarmer.repository.domain.gallery.GalleryFile;
import com.cityfarmer.repository.domain.gallery.RecVO;

public interface GalleryService {
	int count();	//전체게시물

	Map<String, Object> list(int pageNo); // 조회
	
//	List<GalleryBoard> list(GalleryBoard galleryboard); // 조회
	
	void write(GalleryBoard galleryboard, GalleryFile file); // 등록
	
//	GalleryBoard detail(int gaNo); //상세
	Map<String, Object> detail(int gaNo); //상세
	
	void delete(int no); // 삭제
	
	//수정
	void update(GalleryBoard galleryboard);
	GalleryBoard updateForm(int no);

	//파일등록
	void uploadFile(GalleryFile file);

	
	List<GalleryComment> writeComment(GalleryComment comment);

	List<GalleryComment> listComment(int gaNo);
	
	List<GalleryComment> deleteComment(GalleryComment comment);
	
	int rec(int gaNo); // 게시글 추천수
	
	int recCount(RecVO recVO); // 게시글 추천여부 확인
	void insertRec(RecVO recVO); //게시글 추천
	void updateRec(int gaNo); //게시글 총 추천수 증가
	void deleteRec(RecVO recVO); //게시글 추천 취소
	void cancelRec(int gaNo);  // 게시글 총 추천수 감소
	
	Map<String, Object> searchList(SearchVO search); //댓글

}
