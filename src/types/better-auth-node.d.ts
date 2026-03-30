declare module "better-auth/node" {
  import { RequestHandler } from "express";

  // Minimal declaration to satisfy TypeScript when the package doesn't
  // expose subpath typings. Adjust `any` to the correct types if desired.
  export function toNodeHandler(auth: any): RequestHandler;
  export default toNodeHandler;
}
