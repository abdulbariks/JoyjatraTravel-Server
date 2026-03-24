import { Request, Response } from "express";
import status from "http-status";
// import ms, { StringValue } from "ms";
import { envVars } from "../../config/env";
import AppError from "../../errorHelpers/AppError";
import { auth } from "../../lib/auth";
import { catchAsync } from "../../shared/catchAsync";
import { sendResponse } from "../../shared/sendResponse";
import { AuthService } from "./auth.service";
// import { CookieUtils } from "../../utils/cookie";
// import { tokenUtils } from "../../utils/token";


// const registerUser = catchAsync(
//     async (req: Request, res: Response) => {
//         // const maxAge = ms(envVars.ACCESS_TOKEN_EXPIRES_IN as StringValue);
//         // console.log({ maxAge });
//         const payload = req.body;

//         console.log(payload);

//         const result = await AuthService.registerUser(payload);

//         const { 
//             // accessToken, refreshToken,
//              token, ...rest } = result

//         // tokenUtils.setAccessTokenCookie(res, accessToken);
//         // tokenUtils.setRefreshTokenCookie(res, refreshToken);
//         // tokenUtils.setBetterAuthSessionCookie(res, token as string);

//         sendResponse(res, {
//             httpStatusCode: status.CREATED,
//             success: true,
//             message: "Patient registered successfully",
//             data: {
//                 token,
//                 // accessToken,
//                 // refreshToken,
//                 ...rest,
//             }
//         })
//     }
// )






export const AuthController = {
    // registerUser,

 
};