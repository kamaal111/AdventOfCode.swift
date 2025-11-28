import path from 'node:path';
import fs from 'node:fs/promises';

import { fileExists, isDirectory } from './fs';

async function downloadInput(args: { year: number; day: number; sessionId: string }): Promise<boolean> {
  const yearSolutionsInputPath = `Sources/AdventOfCode${args.year}/Input`;
  const yearSolutionsInputIsDirectory = await isDirectory(yearSolutionsInputPath);
  if (!yearSolutionsInputIsDirectory) {
    throw new Error('Solutions folder does not exist');
  }

  const destinationPath = path.join(yearSolutionsInputPath, `day${args.day}.txt`);
  const destinationExists = await fileExists(destinationPath);
  if (destinationExists) {
    return false;
  }

  const response = await fetch(`https://adventofcode.com/${args.year}/day/${args.day}/input`, {
    cache: 'default',
    credentials: 'include',
    headers: {
      Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      Cookie: `session=${args.sessionId}`,
    },
    method: 'GET',
  });
  const text = await response.text();
  await fs.writeFile(destinationPath, text);
  return true;
}

export default downloadInput;
