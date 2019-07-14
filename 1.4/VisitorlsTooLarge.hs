data Expr a = Plus (Expr a)(Expr a)
    | Square(Expr a)
    | Number a

evalExpr::Expr Int -> Int
evalExpr(Plus e1 e2) = evalExpr e1 + evalExpr e2
evalExpr(Square e) = evalExpr e ^ (2::Int)
evalExpr(Number n) = n

showExpr::Expr Int->String
showExpr(Plus e1 e2) = showExpr e2 ++ " + " ++ showExpr e2
showExpr(Square e) = "(" ++ showExpr e ++ ")^2"
showExpr(Number n) = show n

main::IO()
main = do
    let e = Plus(Number 1)(Square (Plus(Number 2)(Number 3)))
    putStrLn (showExpr e)
    print(evalExpr e)