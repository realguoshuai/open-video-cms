package com.zhiyou100.vo;

import java.io.Serializable;

//包装 json 格式返回的数据
//使用泛型在创建对象的时候再指定具体数据类型
public class ResponseVO<T> implements Serializable {
	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = -1273367726114657600L;

	// 请求的结果，如果失败了原因是什么，
	// 如果 errorCode 为 0 表明请求没有错误，返回了正确的数据
	// 如果 errorCode 不为 0 说明没正确的处理请求，错误原因是：xxxx
	private Integer errorCode;

	// 失败原因的文字描述
	private String message;

	// 如果没有失败，需要返回的真正数据
	private T data;

	public ResponseVO() {
		super();
	}

	public ResponseVO(Integer errorCode, String message, T data) {
		super();
		this.errorCode = errorCode;
		this.message = message;
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResponseVO [errorCode=" + errorCode + ", message=" + message + ", data=" + data + "]";
	}

	public Integer getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
