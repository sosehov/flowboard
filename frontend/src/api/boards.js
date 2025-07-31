const API_BASE = process.env.REACT_APP_API_BASE;

export const getBoards = async () => {
  const response = await fetch(`${API_BASE}/boards`);
  if (!response.ok) throw new Error('Failed to fetch boards');
  return await response.json();
};
 