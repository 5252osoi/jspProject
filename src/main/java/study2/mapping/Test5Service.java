package study2.mapping;

public class Test5Service {

	public int calc(int su1, int su2, String op) {
		int res=0;
		//su1= su1 == 0 ? 0 :su1;
		//su1= su1 == 0 ? 1 :su2;
		
		if(op.equals("+")) res=su1+su2;
		else if(op.equals("-")) res=su1-su2;
		else if(op.equals("*")) res=su1*su2;
		
		return res;
	}

	
	
}
