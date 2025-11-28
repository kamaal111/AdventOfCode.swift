import * as v from 'valibot';

export function exitWithValibotIssue(error: unknown): never {
  if (!v.isValiError(error)) {
    throw error;
  }

  console.error(error.message);
  process.exit(1);
}
