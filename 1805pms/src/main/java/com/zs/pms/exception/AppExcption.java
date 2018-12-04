package com.zs.pms.exception;

	public class AppExcption extends Exception {
//		属性 异常码和异常信息
		public int errCode;
		public String errMsg;
		
		

//		生成构造函数
		public AppExcption(int errCode, String errMsg) {
			this.errCode = errCode;
			this.errMsg = errMsg;
		}
//		给全部属性加上setter和getter
		public int getErrcode() {
			return errCode;
		}
		public void setErrcode(int errcode) {
			this.errCode = errcode;
		}
		public String getErrMsg() {
			return errMsg;
		}
		public void setErrMsg(String errMsg) {
			this.errMsg = errMsg;
		}

	}

