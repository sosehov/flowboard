import React, { useEffect, useState } from 'react';
import { Link, link } from 'react-router-dom';
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
          <li key={board.id}>
            <Link to={`/boards/${board.id}`}>{board.title}</Link>
          </li>
        ))}
      </ul>
    </div>
  )
}