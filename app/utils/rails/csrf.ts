export type CSRFHeaders = {
  readonly param: string;
  readonly token: string;
};

export function extractCSRFHeaders({ headers }: Request): CSRFHeaders {
  const param = headers.get("X-CSRF-Param");
  if (!param) {
    throw new Error("Missing X-CSRF-Param header.");
  }
  const token = headers.get("X-CSRF-Token");
  if (!token) {
    throw new Error("Missing X-CSRF-token header.");
  }
  return { param, token };
}
