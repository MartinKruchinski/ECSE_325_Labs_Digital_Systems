public class vhdllab2 {
    public static void program (){
        String number = "";
        for (int index = 1; index < 256; index++) {
            number = Integer.toBinaryString(index) + "000000000000000000000000";
            System.out.println("Test number: "+index + "   A: " +toHexa(number) + "    Floor: " +floor(number) + "   Mod: " +mod(number));
        }
    }

    public static String floor(String A){
        int floor = (int) Math.floor(Long.parseLong(A, 2) / 33401);
        return Integer.toHexString(floor);
    }

    public static String mod(String A){
        Long AtoBinary = Long.parseLong(A, 2);
        Long result = AtoBinary % 33401;
        String toReturn = Long.toHexString(result);
        return toReturn;
    }

    public static String toHexa(String binary){
        Long lBin = Long.parseLong(binary,2);
        return Long.toHexString(lBin);
    }


    public static void main(String[] args) {
       program();
    }
}