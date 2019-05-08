package com.ssafy.exception;

public class TimeoutException extends RuntimeException {

	public TimeoutException() {
		super("일과시간에만 이용할 수 있습니다.");
	}
}
