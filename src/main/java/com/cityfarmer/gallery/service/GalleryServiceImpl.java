package com.cityfarmer.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.mapper.GalleryMapper;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper gaMapper;

	@Override
	public List<GalleryBoard> list(GalleryBoard galleryboard) {
		
		return gaMapper.selectGalleryBoard(galleryboard);
	}
	@Override
	public void write(GalleryBoard galleryboard) {
		gaMapper.insertGalleryBoard(galleryboard);
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

}
