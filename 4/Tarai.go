package main

import "fmt"

func main() {
    res := trai(20, 10, 0)
    fmt.Println(res)
}

func trai(x int, y int, z int) int {
    if x <= y{
        return y
    } else {
        return trai (
            trai((x-1), y, z),
            trai((y-1), z, x),
            trai((z-1), x, y),
        )
    }
}

func trai(x int, y int, z int) int {
    if x <= y{
        return y
    } else {
    }
}
