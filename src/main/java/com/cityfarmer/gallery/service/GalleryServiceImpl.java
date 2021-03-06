package com.cityfarmer.gallery.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.exchange.SearchVO;
import com.cityfarmer.repository.domain.gallery.GaPageResult;
import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryComment;
import com.cityfarmer.repository.domain.gallery.GalleryFile;
import com.cityfarmer.repository.domain.gallery.RecVO;
import com.cityfarmer.repository.mapper.GalleryMapper;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper gaMapper;

	@Override
	public Map<String, Object> list(int pageNo) {
		GalleryBoard galleryboard = new GalleryBoard();
		galleryboard.setPageNo(pageNo);
		
		Map<String, Object> map = new HashMap<>();
		List<GalleryBoard> boardList = gaMapper.selectGalleryBoard(galleryboard);
		
		for(GalleryBoard b : boardList) {
			System.out.println("b.no" + b.getGaNo());
			
			GalleryFile file = gaMapper.selectFileByGaNo(b.getGaNo());
			System.out.println("file: " + file);
			if(file==null) continue;
			
			System.out.println(file.getGafPath()+ "/" + file.getGafSysName());
			b.setUrl(file.getGafPath() + "/" + file.getGafSysName());
			
			
		}
		
		int count = gaMapper.seLectGalleryBoardCount();
		
		map.put("list", boardList);
		map.put("pageResult", new GaPageResult(pageNo,count));
		return  map;
		
	}
	@Override
	public void write(GalleryBoard galleryboard, GalleryFile file) {
		gaMapper.insertGalleryBoard(galleryboard);
		
		file.setGaNo(galleryboard.getGaNo());
		gaMapper.insertGalleryFile(file);
	}
	
	@Override
	public int count() {
		return gaMapper.seLectGalleryBoardCount();
	}
	
	@Override
	public Map<String, Object> detail(int no) {
//		return gaMapper.selectGalleryBoardByNo(no);
		gaMapper.GalleryBoardView(no);
		Map<String, Object> map = new HashMap<>();
		
		GalleryBoard board = gaMapper.selectGalleryBoardByNo(no);
		
		map.put("b", board);
		return map;
	}
	@Override
	public void delete(int no) {
		gaMapper.GalleryDeleteBoard(no);
	}
	@Override
	public void update(GalleryBoard galleryboard) {
		gaMapper.GalleryUpdateBoard(galleryboard);
	}
	@Override
	public GalleryBoard updateForm(int no) {
		return gaMapper.selectGalleryBoardByNo(no);
	}
	
	
	@Override
	public void uploadFile(GalleryFile file) {
		
		gaMapper.insertGalleryFile(file);
	}
	@Override
	public List<GalleryComment> writeComment(GalleryComment comment) {
		gaMapper.insertComment(comment);
		return gaMapper.selectCommentListByGaNo(comment.getGaNo());
	}
	@Override
	public List<GalleryComment> listComment(int gaNo) {
	
		return gaMapper.selectCommentListByGaNo(gaNo);
	}
	@Override
	public List<GalleryComment> deleteComment(GalleryComment comment) {
		gaMapper.deleteComment(comment.getGacNo());
		return gaMapper.selectCommentListByGaNo(comment.getGaNo());
	}
	
	@Override
	public int rec(int gaNo) {
		// TODO Auto-generated method stub
		return gaMapper.rec(gaNo);
	}
	@Override
	public int recCount(RecVO recVO) {
		return gaMapper.recCount(recVO);
	}
	@Override
	public void insertRec(RecVO recVO) {
		gaMapper.insertRec(recVO);
	}
	@Override
	public void updateRec(int gaNo) {

		gaMapper.updateRec(gaNo);
	}
	@Override
	public void deleteRec(RecVO recVO) {

		gaMapper.deleteRec(recVO);
	}
	@Override
	public void cancelRec(int gaNo) {

		gaMapper.cancelRec(gaNo);
	}
	
	@Override
	public Map<String, Object> searchList(SearchVO search) {

		Map<String, Object> map = new HashMap<>();
		List<GalleryBoard> boardList = null;
		int count = 0;
		//System.out.println("search : " + search);
		
		if(search.getType().equals("title")) {	
			boardList = gaMapper.selectBoardByTitle(search);
			count = gaMapper.selectBoardCountByTitle(search);
		} else if(search.getType().equals("writer")) {
			boardList = gaMapper.selectBoardByWriter(search);
			count = gaMapper.selectBoardCountByWriter(search);
		}
		
		System.out.println("boardList : " + boardList);
		
		for(GalleryBoard b : boardList) {
			//System.out.println("board.getno : "+board.getExNo());
			
			GalleryFile file = gaMapper.selectFileByGaNo(b.getGaNo());
			//System.out.println("file : "+file);
			if(file ==null) continue;
			
			//System.out.println(file.getExfPath()+ "/" + file.getExfSysName());
			b.setUrl(file.getGafPath() + "/" + file.getGafSysName());
		}
		
		map.put("list", boardList);
		map.put("pageResult", new GaPageResult(search.getPageNo(), count));
		map.put("search", search);
		return map;
	}
	

}
