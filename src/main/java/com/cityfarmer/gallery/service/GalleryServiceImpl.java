package com.cityfarmer.gallery.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.gallery.GaPageResult;
import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryFile;
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
	public GalleryBoard detail(int no) {
		return gaMapper.selectGalleryBoardByNo(no);
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

}
