package com.yedam.spring.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.spring.user.service.UserListVO;
import com.yedam.spring.user.service.UserVO;

//간단한 에러를 해결해줌
@CrossOrigin
//데이터를 반환하는 컨트롤러 기존의 컨트롤러@Contoroller + @ResponseBody 같이 의미 => 해당 클래스 내의 모든 컨트롤러는 객체를 반환.
@RestController
public class UserRestController {
	
//							경로					통신방식
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public UserVO insertUser(UserVO userVO) {
		
		
		System.out.println("name: "+ userVO.getName());
		System.out.println("age: "+ userVO.getAge());
		
		return userVO;
	}
	
	@RequestMapping("/insertUsers")
	public List<UserVO> insertUserList(UserListVO userListVO){
		for(UserVO user : userListVO.getList()) {
			System.out.println(user);
		}
		return userListVO.getList();
	}
	@RequestMapping("/getUserData")
	public UserVO getUserData(@RequestParam("id") String name,
							  @RequestParam(defaultValue = "0", required = false) Integer age) {
		UserVO userVO = new UserVO();
		userVO.setName(name);
		userVO.setAge(age == null ? 0 : age);
		
		return userVO;
	}
	
	@GetMapping("/getDataList")
	public String getDataList(@RequestParam(required = false) Map<String, Object>map) {
		String message = null;
		if(map.isEmpty()) {
			message = "데이터가 존재하지 않습니다.";
		}else {
			message = "데이터가 생성되었습니다.";
			Set<Map.Entry<String,Object>> entryList = map.entrySet();
			for(Map.Entry<String, Object> enrty : entryList) {
				System.out.println("Key : "+ enrty.getKey());
				System.out.println("Value : "+enrty.getValue());
			}
		}
		return message;
	}
	@RequestMapping("/getNames")
	public Map<String, Object> getNames(@RequestParam List<String> name){
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "Success");
		map.put("data", name);
		
		return map;
	};
	
	@RequestMapping("/getEmpInfo/{employeeId}")
	public UserVO getEmpInfo(@PathVariable String employeeId) {
		UserVO userVO = new UserVO();
		userVO.setName(employeeId);
		return userVO;
	}
	@RequestMapping("/getInfo")
		public UserVO getInfo(@RequestBody UserVO userVO) {
			return userVO;
	}
	@PostMapping("/upload")
	// 파일에 관해서 따로 관리해야하는 경우
	public String uploadFile(@RequestPart MultipartFile[] pic) {
//  public String uploadFile(UserVO userVO){
//		System.out.println("name: "+userVO.getName());
//		System.out.println("file: "+userVO.getPic().length);
		System.out.println(pic[0].getOriginalFilename());
		return "Upload Completed!!!!";
	}
	
}	


