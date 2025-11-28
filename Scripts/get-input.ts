import downloadInput from './utils/download-input';
import { exitWithValibotIssue } from './utils/validation';
import { type DayYearArgs, getDayYearArgs } from './utils/args';
import { getSessionIdEnv, type SessionEnv } from './utils/env';

let values: DayYearArgs;
let env: SessionEnv;
try {
  [values, env] = await Promise.all([getDayYearArgs(), getSessionIdEnv()]);
} catch (error) {
  exitWithValibotIssue(error);
}

const created = await downloadInput({ year: values.year, day: values.day, sessionId: env.AOC_SESSION_ID });
if (!created) {
  console.log('Input file already exists');
} else {
  console.log('Successfully stored input file');
}
