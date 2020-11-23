package com.ph4.s1.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
   
   //MutipartFile transferTo
   public String saveTransfer(File dest, MultipartFile multipartFile)throws Exception{
      if(!dest.exists()) {
         dest.mkdirs();
      }
      
      String fileName = UUID.randomUUID().toString();
      fileName = fileName+"_"+ multipartFile.getOriginalFilename();
      
      dest = new File(dest, fileName);
      
      multipartFile.transferTo(dest);
      
      return fileName;
   }
   
   //FilecopyUtil.copy
   public String saveCopy(File dest, MultipartFile multipartFile)throws Exception{
      
      if(!dest.exists()) {
         dest.mkdirs();
      }
      
      String fileName = UUID.randomUUID().toString();
      fileName = fileName+"_"+ multipartFile.getOriginalFilename();
      
      dest = new File(dest, fileName);
      
      FileCopyUtils.copy(multipartFile.getBytes(), dest);
      
      return fileName;
   }
   
   //지훈 메소드
   public String save(File dest, MultipartFile photo) throws Exception{
         if(!dest.exists()) {
            dest.mkdir();
         }
         
         Calendar ca = Calendar.getInstance();
         long time = ca.getTimeInMillis();
         String name = time + "_" + photo.getOriginalFilename();
         dest = new File(dest, name);
         
         
         photo.transferTo(dest);
         
         return name;
      }

}