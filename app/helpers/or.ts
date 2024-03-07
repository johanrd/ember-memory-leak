export default function or(...params: any[]) {
  for (let i = 0; i < params.length; i++) {
    if (!!params[i]) {
      return params[i];
    }
  }
  return false;
}