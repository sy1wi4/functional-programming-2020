-- Funktory 1: operatory fmap, (<$>) i (<$)


-- The Left constructor on Either is implemented as the "failure case".

-- fmap (+1) (0,0,0) == (0,0,1)

-- (<$)  The default definition is fmap . const
