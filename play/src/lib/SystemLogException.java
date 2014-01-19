package lib;

public final class SystemLogException {

	public SystemLogException() {
		// TODO Auto-generated constructor stub
	}
	
	static public void Print(Exception e) {

		System.out.println("//");
		System.out.println("// getClassName(): " + e.getStackTrace()[0].getClassName());
		System.out.println("// getMethodName(): " + e.getStackTrace()[0].getMethodName());
		System.out.println("// getFileName(): " + e.getStackTrace()[0].getFileName());
		System.out.println("// getLineNumber(): " + e.getStackTrace()[0].getLineNumber());
		System.out.println("//");
		System.out.println("// getClassName(): " + e.getStackTrace()[1].getClassName());
		System.out.println("// getMethodName(): " + e.getStackTrace()[1].getMethodName());
		System.out.println("// getFileName(): " + e.getStackTrace()[1].getFileName());
		System.out.println("// getLineNumber(): " + e.getStackTrace()[1].getLineNumber());
		System.out.println("//");
		System.out.println("// Login");
		System.out.println("//");
		System.out.println("// " + e.getMessage());
		System.out.println("// StackTrace:");
		e.printStackTrace();
		
	}
}
