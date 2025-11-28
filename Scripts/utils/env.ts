import * as v from 'valibot';

export type SessionEnv = v.InferOutput<typeof SessionEnvSchema>;

const SessionEnvSchema = v.object({
  AOC_SESSION_ID: v.pipe(v.string(), v.nonEmpty()),
});

export function getSessionIdEnv(): Promise<SessionEnv> {
  return v.parseAsync(SessionEnvSchema, process.env);
}
