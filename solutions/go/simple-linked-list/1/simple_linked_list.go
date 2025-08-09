package linkedlist

import "errors"

type List struct {
	head *Element
}

type Element struct {
	value int
	next  *Element
}

func New(elements []int) *List {
	list := List{}
	for _, v := range elements {
		list.Push(v)
	}
	return &list
}

func (l *List) Size() int {
	if l.head == nil {
		return 0
	} else {
		cnt := 1
		for elem := l.head; elem.next != nil; elem = elem.next {
			cnt++
		}
		return cnt
	}
}

func (l *List) Push(element int) {
	if l.head == nil {
		l.head = &Element{value: element, next: nil}
	} else {
		l.head = &Element{value: element, next: l.head}
	}
}

func (l *List) Pop() (int, error) {
	if l.head == nil {
		return 0, errors.New("nothing to pop")
	} else {
		v := l.head.value
		l.head = l.head.next
		return v, nil
	}
}

func (l *List) Array() []int {
	reversed := l.Reverse()
	var arr []int

	if reversed.head == nil {
		return arr
	} else {
		arr = append(arr, reversed.head.value)
		for elem := reversed.head; elem.next != nil; elem = elem.next {
			arr = append(arr, elem.next.value)
		}
		return arr
	}
}

func (l *List) Reverse() *List {
	reversed := List{}

	if l.head == nil {
		return &reversed
	} else {
		elem := l.head
		for ; elem.next != nil; elem = elem.next {
			reversed.Push(elem.value)
		}
		reversed.Push(elem.value)
		return &reversed
	}
}
