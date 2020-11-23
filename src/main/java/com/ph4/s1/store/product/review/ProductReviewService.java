package com.ph4.s1.store.product.review;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.store.product.productQnaReply.ProductQnaReplyDTO;
import com.ph4.s1.store.product.reviewFile.ReviewFileDAO;
import com.ph4.s1.store.product.reviewFile.ReviewFileDTO;
import com.ph4.s1.util.FileSaver;
import com.ph4.s1.util.Pager;

@Service
public class ProductReviewService {
	
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	@Autowired
	private ReviewFileDAO reviewFileDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	public List<ProductReviewDTO> getList(ReviewPager reviewPager) throws Exception{
		reviewPager.makeRow();
		reviewPager.setTotalCount(productReviewDAO.getCount(reviewPager));
		reviewPager.makePage();
		List<ProductReviewDTO> ar = productReviewDAO.getList(reviewPager);
		for(ProductReviewDTO dto : ar) {
			ReviewFileDTO reviewFileDTO = reviewFileDAO.getFile(dto);
			if(reviewFileDTO != null) {
				dto.setFileName(reviewFileDTO.getFileName());
			}
		}
		
		return ar;
	}
	
	public int setInsert(ProductReviewDTO productReviewDTO, MultipartFile file, HttpSession httpSession) throws Exception {
		String path = httpSession.getServletContext().getRealPath("/resources/img/upload/product/review");
		File file2 = new File(path);
		
		if(!file2.exists()) {
			file2.mkdir();
		}
		
		int result = productReviewDAO.setInsert(productReviewDTO);
		if(file.getSize() != 0) {
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			String fileName = fileSaver.save(file2, file);
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setOriName(file.getOriginalFilename());
			reviewFileDTO.setReview_num(productReviewDTO.getReview_num());
			result = reviewFileDAO.setInsert(reviewFileDTO);
		}
		return result;
	}
	
	public int setDelete(ProductReviewDTO productReviewDTO) {
		return productReviewDAO.setDelete(productReviewDTO);
	}
	
	
	//------------------admin-----------------------------------------------------------
	
	public List<ProductReviewDTO> getReviewList_admin(Pager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(productReviewDAO.getCount_admin(pager));
		pager.makePage();
		List<ProductReviewDTO> ar = productReviewDAO.getReviewList_admin(pager);
		for(ProductReviewDTO dto : ar) {
			ReviewFileDTO reviewFileDTO = reviewFileDAO.getFile(dto);
			if(reviewFileDTO != null) {
				dto.setFileName(reviewFileDTO.getFileName());
			}
		}
		return ar;
	}
	
	public ProductReviewDTO getReviewOne_admin(ProductReviewDTO productReviewDTO) throws Exception{
		return productReviewDAO.getReviewOne_admin(productReviewDTO);
	}
}
