-- Funkcje: zip, unzip i zipWith


isSortedAsc :: Ord a => [a] -> Bool
isSortedAsc xs = all (\(x, y) -> x <= y) $ zip xs (tail xs)
-- dostaniemy listę par elementów z następnikami, sprawdzamy więc, 
-- czy następnik jest >=, w każdej takiej parze


everySecond :: [t] -> [t]
everySecond xs = map fst $ filter (odd . snd) $ zip xs [1..]
-- everySecond xs = fst $ unzip $ filter (odd . snd) $ zip xs [1..]     też działa

-- fst, snd - odpowiednio pierwszy i drugi element krotki
-- tworzymy pary, gdzie drugi element mówi, która w kolejności to para (od 1)
-- wybieramy te pary, gdzie drugi element (indeks) jest parzysty, mapujemy na
-- pierwszy element krotki, bo to nas interesuje
