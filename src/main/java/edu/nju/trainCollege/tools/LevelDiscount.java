package edu.nju.trainCollege.tools;

public class LevelDiscount {

    private static final int[] EXPR_THRESHOLD = {100,300,800,1500,3000,5000,10000};
    private static final double[] DISCOUNT_THRESHOLD = {0.98,0.95,0.93,0.9,0.88,0.85,0.83,0.8};

    public static int getLevel(int expr){
        int i;
        for(i = 0;i<EXPR_THRESHOLD.length;i++){
            if(expr<EXPR_THRESHOLD[i])
                return i+1;
        }
        return i+2;
    }

    public static double getDiscount(int expr){
        int i;
        for(i = 0;i<EXPR_THRESHOLD.length;i++){
            if(expr<EXPR_THRESHOLD[i])
                return DISCOUNT_THRESHOLD[i];
        }
        return DISCOUNT_THRESHOLD[i+1];
    }

    public static int[] getExprThreshold(){
        return EXPR_THRESHOLD;
    }

    public static double[] getDiscountThreshold(){
        return DISCOUNT_THRESHOLD;
    }
}
