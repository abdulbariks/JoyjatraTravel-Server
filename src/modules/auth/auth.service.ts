import status from "http-status";
// import { JwtPayload } from "jsonwebtoken";
// import { UserStatus } from "../../../generated/prisma/enums";
import { envVars } from "../../config/env";
import AppError from "../../errorHelpers/AppError";
// import { IRequestUser } from "../../interfaces/requestUser.interface";
import { auth } from "../../lib/auth";
import { prisma } from "../../lib/prisma";
// import { jwtUtils } from "../../utils/jwt";
// import { tokenUtils } from "../../utils/token";
import { IChangePasswordPayload, ILoginUserPayload, IRegisterPatientPayload } from "./auth.interface";



// const registerUser = async (payload: IRegisterPatientPayload) => {
//     const { name, email, password } = payload;

//     const data = await auth.api.signUpEmail({
//         body: {
//             name,
//             email,
//             password,
//             //default values
//             // needsPasswordChange: false,
//             // role: Role.PATIENT
//         }
//     })

//     if (!data.user) {
//         // throw new Error("Failed to register patient");
//         throw new AppError(status.BAD_REQUEST, "Failed to register patient");
//     }

//     //TODO : Create Patient Profile In Transaction After Sign Up Of Patient In USer Model
//     try {
//         const patient = await prisma.$transaction(async (tx) => {

//             const patientTx = await tx.user.create({
//                 data: {
//                     userId: data.user.id,
//                     name: payload.name,
//                     email: payload.email,
//                 }
//             })

//             return patientTx
//         })

//         // const accessToken = tokenUtils.getAccessToken({
//         //     userId: data.user.id,
//         //     role: data.user.role,
//         //     name: data.user.name,
//         //     email: data.user.email,
//         //     status: data.user.status,
//         //     isDeleted: data.user.isDeleted,
//         //     emailVerified: data.user.emailVerified,
//         // });

//         // const refreshToken = tokenUtils.getRefreshToken({
//         //     userId: data.user.id,
//         //     role: data.user.role,
//         //     name: data.user.name,
//         //     email: data.user.email,
//         //     status: data.user.status,
//         //     isDeleted: data.user.isDeleted,
//         //     emailVerified: data.user.emailVerified,
//         // });

//         return {
//             ...data,
//             // accessToken,
//             // refreshToken,
//             patient
//         }

//     } catch (error) {
//         console.log("Transaction error : ", error);
//         await prisma.user.delete({
//             where: {
//                 id: data.user.id
//             }
//         })
//         throw error;
//     }

// }




export const AuthService = {
    // registerUser,

};