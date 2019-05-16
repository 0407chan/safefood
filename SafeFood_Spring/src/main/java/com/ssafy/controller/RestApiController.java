package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.ExpFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.aBoard;
import com.ssafy.model.dto.getAte;
import com.ssafy.model.dto.qBoard;
import com.ssafy.model.service.AteFoodService;
import com.ssafy.model.service.ExpFoodService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.aBoardService;
import com.ssafy.model.service.qBoardService;

@RestController
public class RestApiController {

	private static final String OK = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	FoodService fservice;
	
	@Autowired
	aBoardService aservice;
	
	@Autowired
	qBoardService qservice;
	
	@Autowired
	AteFoodService ateservice;
	
	@Autowired
	ExpFoodService expservice;
	
	@GetMapping("/getboards")
	public ResponseEntity<List<qBoard>> getAllqBoard() {
		return new ResponseEntity<List<qBoard>>(qservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/getAnswers")
	public ResponseEntity<List<aBoard>> getAllaBoard() {
		return new ResponseEntity<List<aBoard>>(aservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/getFoods")
	public ResponseEntity<List<Food>> getAllFood() {
		return new ResponseEntity<List<Food>>(fservice.selectAll(), HttpStatus.OK);
	}
	
	@PostMapping("/getExpFoods/{userid}")
	public ResponseEntity<List<getAte>> getExpFoods(@PathVariable String userid) {
		List<ExpFood> today = expservice.selectAll(userid);
		List<getAte> foods = new ArrayList<>();
		for (int i = 0; i < today.size(); i++) {
			Food food = fservice.select(today.get(i).getCode());
			foods.add(new getAte(0, food.getCode(), food.getImg(), food.getName(), today.get(i).getNum(), ""));  
		}
		return new ResponseEntity<List<getAte>>(foods, HttpStatus.OK);
	}
	
	@PostMapping("/updateExpFoods/{params}")
	public ResponseEntity<String> updateExpFoods(@PathVariable String params){
		String s[] = params.replace("code=", "").replace("num=", "").split("&");
		int code = Integer.parseInt(s[0]);
		int num = Integer.parseInt(s[1]);
		if(num >0) {
			ExpFood ex = expservice.select(code);
			ex.setNum(num);
			expservice.update(ex);
		}else {
			expservice.delete(code);
		}
		
		return new ResponseEntity<String>("good", HttpStatus.OK);
	}
	
	@PostMapping("/getExpFoodsNutr/{userid}")
	public ResponseEntity<List<Food>> getExpFoodsNutr(@PathVariable String userid) {
		Food temp = new Food();
		List<ExpFood> exps = expservice.selectAll(userid);
		for(int i=0; i<exps.size(); i++) {
			Food food = fservice.select(exps.get(i).getCode());
			temp.setCalory( Math.round( (temp.getCalory()+food.getCalory()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setCarbo( Math.round( (temp.getCarbo()+food.getCarbo()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setProtein( Math.round( (temp.getProtein()+food.getProtein()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setFat( Math.round( (temp.getFat()+food.getFat()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setSugar( Math.round( (temp.getSugar()+food.getSugar()*exps.get(i).getNum() )*100 )/100.0 );
			
			temp.setNatrium( Math.round( (temp.getNatrium()+food.getNatrium()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setChole( Math.round( (temp.getChole()+food.getChole()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setFattyacid( Math.round( (temp.getFattyacid()+food.getFattyacid()*exps.get(i).getNum() )*100 )/100.0 );
			temp.setTransfat( Math.round( (temp.getTransfat()+food.getTransfat()*exps.get(i).getNum() )*100 )/100.0 );
		}
		List<Food> today = new ArrayList<Food>();
		today.add(temp);
		Food t = new Food();
		t.setCalory(Math.round(temp.getCalory()/2000*100));
		t.setCarbo(Math.round(temp.getCarbo()/328*100));
		t.setProtein(Math.round(temp.getProtein()/25*100));
		t.setFat(Math.round(temp.getFat()/50*100));
		//t.setSugar(Math.round(temp.getSugar()/50*0)/10);
		t.setNatrium(Math.round(temp.getNatrium()/2000*100));
		t.setChole(Math.round(temp.getChole()/300*100));
		t.setFattyacid(Math.round(temp.getFattyacid()/15*100));
		//t.setTransfat(Math.round(temp.getTransfat()/50*0)/10);
		today.add(t);
		return new ResponseEntity<List<Food>>(today, HttpStatus.OK);
	}
	
	@DeleteMapping("/expFoodDelete/{idx}")
	public ResponseEntity<String> expFoodDelete(@PathVariable int idx) {
		if(expservice.select(idx) != null)
			expservice.delete(idx);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	@DeleteMapping("/ateFoodDelete/{idx}")
	public ResponseEntity<String> ateFoodDelete(@PathVariable int idx) {
		if(ateservice.select(idx) != null) {
			Food f = fservice.select(ateservice.select(idx).getCode());
			f.setAtecount(f.getAtecount()- ateservice.select(idx).getNum());
			fservice.update(f);
			ateservice.delete(idx);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/getBestFoods/{index}")
	public ResponseEntity<List<Food>>getBestFoods(@PathVariable int index){
		List<Food> foods = null;
		switch(index) {
		case 1:
			foods = fservice.bestFoodAll();
			break;
		case 2:
			foods = fservice.bestAteFoodAll();
		}
		return new ResponseEntity<List<Food>>(foods, HttpStatus.OK);
	}
	
	
	
	@PostMapping("/getAteFoodbyDate/{date}")
	public ResponseEntity <List<getAte>> getAteFoodbyDate(@PathVariable String date, HttpSession session){
		Member m = (Member)session.getAttribute("user");
		List<AteFood> day = ateservice.searchByDay(date);
		List<getAte> foods = new ArrayList<>();
		for (int i = 0; i < day.size(); i++) {
			if(day.get(i).getId().equals(m.getId())) {
				Food food = fservice.select(day.get(i).getCode());
				foods.add(new getAte(day.get(i).getAtekey(), food.getCode(), food.getImg(), food.getName(), day.get(i).getNum(), day.get(i).getDate()));  
			}
		}
		return new ResponseEntity<List<getAte>>(foods, HttpStatus.OK);
	}
	
	
	@PostMapping("/searchByIdGetToday/{userid}")
	public ResponseEntity <List<getAte>> getAteFoodsearchByIdGetToday(@PathVariable String userid){
		List<AteFood> today = ateservice.searchByIdGetToday(userid);
		List<getAte> foods = new ArrayList<>();
		for (int i = 0; i < today.size(); i++) {
			Food food = fservice.select(today.get(i).getCode());
			foods.add(new getAte(today.get(i).getAtekey(), food.getCode(), food.getImg(), food.getName(), today.get(i).getNum(), today.get(i).getDate()));  
		}
		return new ResponseEntity<List<getAte>>(foods, HttpStatus.OK);
	}
	
	@PostMapping("/getAteFoods/{userid}")
	public ResponseEntity <List<getAte>> getAteFoods(@PathVariable String userid){
		List<AteFood> today = ateservice.selectAll(userid);
		List<getAte> foods = new ArrayList<>();
		for (int i = 0; i < today.size(); i++) {
			Food food = fservice.select(today.get(i).getCode());
			foods.add(new getAte(today.get(i).getAtekey(), food.getCode(), food.getImg(), food.getName(), today.get(i).getNum(), today.get(i).getDate()));  
		}
		Collections.sort(foods, new Comparator<getAte>() {
			@Override
			public int compare(getAte o1, getAte o2) {
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		
		return new ResponseEntity<List<getAte>>(foods, HttpStatus.OK);
	}
	
	/*
	탄수화물 328g
	단백질 25g
	지방 50g
	포화지방 15g
	콜레스테롤 300mg
	나트륨 2000mg
	*/ 
	@PostMapping("/getTodayAteFoods/{userid}")
	public ResponseEntity <List<Food>> getTodayAteFoods(@PathVariable String userid){
		Food temp = ateservice.getTodayAteFood(userid);
		List<Food> today = new ArrayList<>();
		today.add(temp);
		Food t = new Food();
		t.setCalory(Math.round(temp.getCalory()/2000*1000)/10);
		t.setCarbo(Math.round(temp.getCarbo()/328*1000)/10);
		t.setProtein(Math.round(temp.getProtein()/25*1000)/10);
		t.setFat(Math.round(temp.getFat()/50*1000)/10);
		//t.setSugar(Math.round(temp.getSugar()/50*0)/10);
		t.setNatrium(Math.round(temp.getNatrium()/2000*1000)/10);
		t.setChole(Math.round(temp.getChole()/300*1000)/10);
		t.setFattyacid(Math.round(temp.getFattyacid()/15*1000)/10);
		//t.setTransfat(Math.round(temp.getTransfat()/50*0)/10);
		today.add(t);
		return new ResponseEntity<List<Food>>(today, HttpStatus.OK);
	}
	
	@PostMapping("/getAteFoodNutrbyDate/{date}")
	public ResponseEntity <List<Food>> getAteFoodNutrbyDate(@PathVariable String date, HttpSession session){
		Member m = (Member)session.getAttribute("user");
		AteFood af = new AteFood();
		af.setId(m.getId());
		af.setDate(date);
		Food temp = ateservice.getAteFoodNutrbyDate(af);
		List<Food> today = new ArrayList<>();
		if(temp == null)
			temp = new Food();
		today.add(temp);
		Food t = new Food();
		t.setCalory(Math.round(temp.getCalory()/2000*1000)/10);
		t.setCarbo(Math.round(temp.getCarbo()/328*1000)/10);
		t.setProtein(Math.round(temp.getProtein()/25*1000)/10);
		t.setFat(Math.round(temp.getFat()/50*1000)/10);
		//t.setSugar(Math.round(temp.getSugar()/50*0)/10);
		t.setNatrium(Math.round(temp.getNatrium()/2000*1000)/10);
		t.setChole(Math.round(temp.getChole()/300*1000)/10);
		t.setFattyacid(Math.round(temp.getFattyacid()/15*1000)/10);
		//t.setTransfat(Math.round(temp.getTransfat()/50*0)/10);
		today.add(t);
		return new ResponseEntity<List<Food>>(today, HttpStatus.OK);
	}
	
	
	@GetMapping("/findFoods/{name}")
	public ResponseEntity<List<Food>> findFoods(@PathVariable String name, HttpSession session){
		String s[] = name.replace("name=", "").replace("searchField=", "").split("&");
		List<Food> foods = null; 
		switch(s[1]) {
		case "whole":
			foods = fservice.searchAll(s[0].trim());
			break;
		case "name":
			foods = fservice.searchByName(s[0].trim());
			break;
		case "maker":
			foods = fservice.searchByMaker(s[0].trim());
			break;
		case "material":
			foods = fservice.searchByMaterial(s[0].trim());
			break;
		}
		
		return new ResponseEntity<List<Food>>(foods, HttpStatus.OK);
	}
	
	@PostMapping("/addAnswer")
	public ResponseEntity<String> addAnswer(@RequestBody aBoard aboard, HttpSession session) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Member m = (Member)session.getAttribute("user");
		qBoard qboard = qservice.select(aboard.getIdx());
		aboard.setUserid(m.getId());
		qboard.setState(true);
		aboard.setDate(format.format(date));
		qservice.update(qboard);
		aservice.insert(aboard);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/updateQuestion")
	public ResponseEntity<String> updateQuestion(@RequestBody qBoard qboard,HttpSession session) {
		int index = qboard.getIdx();
		qBoard q = qservice.select(index);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		q.setContent(qboard.getContent());
		q.setDate(format.format(date));
		
		qservice.update(q);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/updateAnswer")
	public ResponseEntity<String> updateAnswer(@RequestBody aBoard aboard, HttpSession session) {
		int index = aboard.getIdx();
		aBoard a = aservice.select(index);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		a.setContent(aboard.getContent());
		a.setDate(format.format(date));
		
		aservice.update(a);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/addQuestion")
	public ResponseEntity<String> addQuestion(@RequestBody qBoard qboard,HttpSession session) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Member m = (Member)session.getAttribute("user");
		qboard.setUserid(m.getId());
		qboard.setState(false);
		qboard.setDate(format.format(date));
		qservice.insert(qboard);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteQuestion/{idx}")
	public ResponseEntity<String> deleteQuestion(@PathVariable int idx) {
		if(aservice.select(idx) != null)
			aservice.delete(idx);
		qservice.delete(idx);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteAnswer/{idx}")
	public ResponseEntity<String> deleteAnswer(@PathVariable int idx) {
		qBoard qboard = qservice.select(idx);
		qboard.setState(false);
		qservice.update(qboard);
		aservice.delete(idx);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
}
