// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title GradeSystem
*@dev write a contract to practive with enum to create a user-defined type
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/
contract GradeSystem {
    enum Grade{A_Plus,A,A_Minus,B_Plus,B,B_Minus,C,D,F}

    function getGrade(uint grade) public pure returns (Grade) {
        if( grade < 100 && grade >= 95)
            return Grade.A_Plus;
        else if(grade<95 && grade >= 93)
            return Grade.A;
        else if(grade<93 && grade >= 90)
            return Grade.A_Minus;
        else if(grade<90 && grade >= 87)
            return Grade.B_Plus;
        else if(grade<87 && grade >= 84)
            return Grade.B;
        else if(grade<84 && grade >= 80)
            return Grade.B_Minus;
        else if(grade<80 && grade >= 70)
            return Grade.C;
        else if(grade<70 && grade >= 60)
            return Grade.D;
        else 
            return Grade.F;
    }
    
}