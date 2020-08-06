package com.artauction.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.artauction.domain.ImageVO;
import com.artauction.mapper.RegisterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_= {@Autowired})
	private RegisterMapper registerMapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
	
	// 매일 오후 3시마다 자동으로 실행
	// 하루전의 파일을 확인해서 DB에없는 파일이있으면 삭제하는 메소드
	@Scheduled(cron = "0 0 15 * * *")
	public void checkFiles() throws Exception{
		// 하루전 파일을 DB에서 찾음
		List<ImageVO> fileList = registerMapper.getOldFiles();
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadpath(), vo.getUuid() + "_" + vo.getFilename()))
				.collect(Collectors.toList());
		
		fileListPaths.forEach(p -> log.warn(p));
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		// DB테이블에 없는 파일 수집
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("===================================");
		System.out.println("-----------------------------------------------------------");
		
		// DB테이블에 없는 파일이 목록 삭제
		for(File file : removeFiles) {
			file.delete();
			log.warn("목록에 없는 파일삭제....");
			System.out.println(" !!!! db에 존재하지않는 하루전 폴더의 파일을 삭제하였습니다");
		}
	}
	
}
