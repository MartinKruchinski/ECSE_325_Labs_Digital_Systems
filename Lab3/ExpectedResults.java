public class ExpectedResults {
    public static void program (int index, Long C){
        System.out.println("Test number: "+index + "   C: " +toHexa(C) + "    D: " + "5" + "   C^5 Mod 33401 = " +mod(exp(C)));
        System.out.println();
    }

    private static String exp(Long c){
        Long result = (long) Math.pow(c, 5);
        return Long.toBinaryString(result);
    }
    public static String mod(String A){
        Long AtoBinary = Long.parseLong(A, 2);
        Long result = AtoBinary % 33401;
        String toReturn = Long.toHexString(result);
        return toReturn;
    }

    public static String toHexa(Long binary){
        return Long.toHexString(binary);
    }


    public static void main(String[] args) {
       program(1, 3L);
       program(2, 31L);
       program(3, 543L);
       program(4, 799L);
       program(5, 927L);
       program(6, 991L);
       program(7, 926L);
       program(8, 0L);
       program(9, 1023L);

    }
}