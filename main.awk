{
    x = $1
    y = $2
    z = $3
    seat_width = y + z
    seat_num = (x - z) / seat_width
    print int(seat_num)
}
