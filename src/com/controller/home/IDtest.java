package com.controller.home;

public class IDtest {
	
	public boolean idtest(String idnumber) {
		boolean check=false;
		idnumber = idnumber.replace(" ", "");
		System.out.println(idnumber);
		System.out.println(idnumber.length());
		if(idnumber.length()==18) {
			String q = idnumber.substring(0,idnumber.length()-1);
			int Dnum=0;
			for(int i=0;i<17;i++) {
//				System.out.println(i);
				if(q.substring(i,i+1).matches("\\D")) {
					return check;
				}
				Dnum+=1;
			}
			System.out.println(Dnum);
			if(Dnum==17) {
				int[] num = new int[idnumber.length()-1];
				for(int u=0;u<idnumber.length()-1;u++) {
					int b=Integer.parseInt(idnumber.substring(u,u+1));
					num[u]=b;
				}
				int j = 7*num[0]+9*num[1]+10*num[2]+5*num[3]+8*num[4]+4*num[5]+2*num[6]+1*num[7]+6*num[8]+3*num[9]+7*num[10]+9*num[11]+10*num[12]+5*num[13]+8*num[14]+4*num[15]+2*num[16];
				int d = j%11;
				int f=0;
				switch(d) {
				case 0:f=1;break;
				case 1:f=0;break;
				case 3:f=9;break;
				case 4:f=8;break;
				case 5:f=7;break;
				case 6:f=6;break;
				case 7:f=5;break;
				case 8:f=4;break;
				case 9:f=3;break;
				case 10:f=2;break;
				}
				if(idnumber.substring(idnumber.length()-1, idnumber.length()).equals("x") || idnumber.substring(idnumber.length()-1, idnumber.length()).equals("X")) {
					if(d==2) {
						check=true;
					}
				}
				if(!(idnumber.substring(idnumber.length()-1, idnumber.length()).matches("\\D")) && Integer.parseInt(idnumber.substring(idnumber.length()-1, idnumber.length()))==f) {
					check=true;
				}
				else {
					check=false;
				}
			}
			else {
				check=false;
			}
		}
		
		System.out.println(check);
		return check;
	}
}
