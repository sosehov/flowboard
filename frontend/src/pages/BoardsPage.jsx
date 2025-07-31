import React, { useEffect, useState } from 'react';
import { getBoards } from '../api/boards';

export default function BoardsPage() {
  const [boards, setBoards] = useState([]);

  useEffect(() => {
    getBoards()
      .then(setBoards)
      .catch(console.error);
  }, []);

  return (
    <div>
      <h1> Your Boards</h1>
      <ul>
        {boards.map(board => (
          <li key={board.id}>{board.title}</li>
        ))}
      </ul>
    </div>
  )
}