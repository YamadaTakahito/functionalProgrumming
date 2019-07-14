interface Visitor<N, R> {
    R plus(Expr<N> e1, Expr<N> e2);

    R square(Expr<N> e);

    R number(N e);
}

interface Expr<N> {
    <R> R accept(Visitor<N, R> v);
}

class Plus<N> implements Expr<N> {
    Expr<N> e1;
    Expr<N> e2;

    Plus(Expr<N> e1, Expr<N> e2) {
        this.e1 = e1;
        this.e2 = e2;
    }

    public <R> R accept(Visitor<N, R> v) {
        return v.plus(e1, e2);
    }
}

class Square<N> implements Expr<N> {
    Expr<N> e;

    Square(Expr<N> e) {
        this.e = e;
    }

    public <R> R accept(Visitor<N, R> v) {
        return v.square(e);
    }
}

class Number<N> implements Expr<N> {
    N n;

    Number(N n) {
        this.n = n;
    }

    public <R> R accept(Visitor<N, R> v) {
        return v.number(n);
    }
}

class Eval implements Visitor<Integer, Integer> {
    public Integer plus(Expr<Integer> e1, Expr<Integer> e2) {
        return e1.accept(this) + e2.accept(this);
    }

    public Integer square(Expr<Integer> e) {
        Integer x = e.accept(this);
        return x * x;
    }

    public Integer number(Integer n) {
        return n;
    }
}

class Show implements Visitor<Integer, String> {
    public String plus(Expr<Integer> e1, Expr<Integer> e2) {
        return e1.accept(this) + " + " + e2.accept(this);
    }

    public String square(Expr<Integer> e) {
        return "(" + e.accept(this) + ")^2";
    }

    public String number(Integer n) {
        return n + "";
    }
}

public class TestVisitor {
    public static void main(String[] args) {
        Expr e = new Plus(new Number(1), new Square(new Plus(new Number(2), new Number(3))));
        System.out.println(e.accept(new Show()));
        System.out.println(e.accept(new Eval()));
    }
}