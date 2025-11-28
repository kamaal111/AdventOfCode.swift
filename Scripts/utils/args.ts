import utils from 'node:util';

import * as v from 'valibot';

export type DayYearArgs = v.InferOutput<typeof DayYearArgsSchema>;

const currentYear = new Date().getFullYear();

const DayYearArgsSchema = v.object({
  year: v.pipe(v.string(), v.transform(Number), v.number(), v.integer(), v.minValue(2015), v.maxValue(currentYear + 1)),
  day: v.pipe(v.string(), v.transform(Number), v.number(), v.integer(), v.minValue(1), v.maxValue(31)),
});

export async function getDayYearArgs(): Promise<DayYearArgs> {
  const { values: rawValues } = utils.parseArgs({
    strict: true,
    options: { year: { type: 'string' }, day: { type: 'string' } },
  });

  return v.parseAsync(DayYearArgsSchema, rawValues);
}
