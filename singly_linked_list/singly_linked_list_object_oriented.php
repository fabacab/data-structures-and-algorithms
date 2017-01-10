<?php
/**
 * Singly linked list.
 *
 * @author Meitar "maymay" Moscovitz <meitarm+github@gmail.com>
 */

/**
 * Singly linked list.
 *
 * A singly linked list is a data structure consisting of a logical
 * sequence of elements, each of which point to the next element.
 */
class Singly_Linked_List {

    /**
     * A pointer to the current item.
     *
     * @var Singly_Linked_List_Element
     */
    public $current;

    /**
     * A pointer to the first item.
     *
     * @var Singly_Linked_List_Element
     */
    public $first;

    /**
     * A pointer to the last item.
     *
     * @var Singly_Linked_List_Element
     */
    public $last;

    /**
     * @param array $items A PHP array of values to put into a Singly Linked List.
     */
    public function __construct ($items) {
        $this->first = new Singly_Linked_List_Element($items[0]);

        $this->current = $this->first;

        for ($i = 1; $i < count($items); $i++) {
            $this->current->next = new Singly_Linked_List_Element($items[$i]);
            $this->current = $this->current->next;
        }

        $this->last = $this->current;
    }

    /**
     * Seeks to the beginning of the list.
     *
     * @return Singly_Linked_List
     */
    public function reset () {
        $this->current = $this->first;
        return $this;
    }

    /**
     * Seeks to the end of the list.
     *
     * @return Singly_Linked_List
     */
    public function end () {
        $this->current = $this->last;
        return $this;
    }

}

/**
 * An element in a Singly_Linked_List.
 */
class Singly_Linked_List_Element {

    /**
     * The value of the element.
     *
     * @var mixed $value
     */
    public $value;

    /**
     * The next element in the list.
     *
     * @var Singly_Linked_List_Element
     */
    public $next;

    /**
     * Creates a Singly Linked List element.
     *
     * @param mixed $value The value of this element.
     * @param null|Singly_Linked_List_Element The next element in the list, or `null` to indicate the final element.
     */
    public function __construct ($value, $next = null) {
        $this->value = $value;
        $this->next = $next;
    }

}

// Let's put these items into a singly linked list.
$items = array('hairbrush', 'stuffed animal', 'blanket', 'cooking pot');
$singly_linked_list = new Singly_Linked_List($items);
var_dump($singly_linked_list);
