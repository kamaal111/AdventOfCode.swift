import fs from 'node:fs/promises';

export async function isDirectory(filepath: string): Promise<boolean> {
  const stat = await fs.stat(filepath);
  return stat.isDirectory();
}

export async function fileExists(filepath: string): Promise<boolean> {
  try {
    await fs.access(filepath);
    return true;
  } catch {
    return false;
  }
}
