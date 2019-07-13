import java.util.Optional;
import java.util.function.Function;
import java.util.function.BiFunction;
import java.io.*;

public class TestOptional {
    private static Optional<String[]> words(String expr) {
        String[] result = expr.split(" ");
        return 3 == result.length ? Optional.of(result) : Optional.empty();
    }

    private static Optional<Integer> toNum(String s) {
        try {
            return Optional.of(Integer.parseInt(s));
        } catch (NumberFormatException ex) {
            return Optional.empty();
        }
    }

    private static Optional<Integer> add(Integer a, Integer b) {
        return Optional.of(a + b);
    }

    private static Optional<Integer> sub(Integer a, Integer b) {
        return Optional.of(a - b);
    }

    private static Optional<Integer> mul(Integer a, Integer b) {
        return Optional.of(a * b);
    }

    private static Optional<Integer> div(Integer a, Integer b) {
        return 0 != b ? Optional.of(a / b) : Optional.empty();
    }

    private static Optional<BiFunction<Integer, Integer, Optional<Integer>>> toBinOp(String s) {
        return s.equals("+") ? Optional.of(TestOptional::add)
                : s.equals("-") ? Optional.of(TestOptional::sub)
                        : s.equals("*") ? Optional.of(TestOptional::mul)
                                : s.equals("/") ? Optional.of(TestOptional::div) : Optional.empty();
    }

    public static void main(String[] args) throws Exception {
        String expr = new BufferedReader(new InputStreamReader(System.in)).readLine();
        System.out.println(words(expr)
                .flatMap(ss -> toNum(ss[0])
                        .flatMap(a -> toBinOp(ss[1]).flatMap(op -> toNum(ss[2]).flatMap(b -> op.apply(a, b)))))
                .map(n -> "" + n).orElseGet(() -> "invalid"));
    }
}
