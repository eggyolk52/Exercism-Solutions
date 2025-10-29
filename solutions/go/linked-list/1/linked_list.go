package linkedlist

import (
	"errors"
)

type Node struct {
	Value interface{}
	prev  *Node
	next  *Node
}

type List struct {
	head *Node
	tail *Node
}

func NewList(elements ...interface{}) *List {
	if len(elements) == 0 {
		return &List{}
	}

	head := Node{Value: elements[0]}
	l := List{head: &head, tail: &head}

	for i := 1; i < len(elements); i++ {
		l.Push(elements[i])
	}

	return &l
}

func (n *Node) Next() *Node {
	return n.next
}

func (n *Node) Prev() *Node {
	return n.prev
}

func (l *List) Unshift(v interface{}) {
	newHead := Node{Value: v}

	if oldHead := l.head; oldHead != nil {
		newHead.next = oldHead
		oldHead.prev = &newHead
	}

	l.head = &newHead

	if l.tail == nil {
		l.tail = &newHead
	}
}

func (l *List) Push(v interface{}) {
	newTail := Node{Value: v}

	if oldTail := l.tail; oldTail != nil {
		newTail.prev = oldTail
		oldTail.next = &newTail
	}

	l.tail = &newTail

	if l.head == nil {
		l.head = &newTail
	}
}

func (l *List) Shift() (interface{}, error) {
	if l.head == nil {
		return nil, errors.New("nothing to shift")
	} else if l.head.next == nil {
		headValue := l.head.Value
		l.head, l.tail = nil, nil
		return headValue, nil
	} else {
		headValue := l.head.Value
		l.head = l.head.next
		l.head.prev = nil
		return headValue, nil
	}
}

func (l *List) Pop() (interface{}, error) {
	if l.tail == nil {
		return nil, errors.New("nothing to pop")
	} else if l.tail.prev == nil {
		tailValue := l.tail.Value
		l.head, l.tail = nil, nil
		return tailValue, nil
	} else {
		tailValue := l.tail.Value
		l.tail = l.tail.prev
		l.tail.next = nil
		return tailValue, nil
	}
}

func (l *List) Reverse() {
	var newList []interface{}

	for next := l.head; next != nil; next = next.Next() {
		value := next.Value
		newList = append(newList, value)
	}

	l.head, l.tail = nil, nil
	for _, v := range newList {
		l.Unshift(v)
	}
}

func (l *List) First() *Node {
	return l.head
}

func (l *List) Last() *Node {
	return l.tail
}
