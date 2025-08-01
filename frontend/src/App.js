import { BrowserRouter, Routes, Route } from 'react-router-dom';
import BoardsPage from './pages/BoardsPage';
import BoardDetailPage from './pages/BoardDetailPage';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/boards" element={<BoardsPage />} />
        <Route path="/boards/:id" element={<BoardDetailPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
