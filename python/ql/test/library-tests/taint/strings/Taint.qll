import python
import semmle.python.security.TaintTracking
import semmle.python.security.strings.Untrusted
import semmle.python.security.Exceptions

class SimpleSource extends TaintSource {
    SimpleSource() { this.(NameNode).getId() = "TAINTED_STRING" }

    override predicate isSourceOf(TaintKind kind) { kind instanceof ExternalStringKind }

    override string toString() { result = "taint source" }
}

class ListSource extends TaintSource {
    ListSource() { this.(NameNode).getId() = "TAINTED_LIST" }

    override predicate isSourceOf(TaintKind kind) { kind instanceof ExternalStringSequenceKind }

    override string toString() { result = "list taint source" }
}

class DictSource extends TaintSource {
    DictSource() { this.(NameNode).getId() = "TAINTED_DICT" }

    override predicate isSourceOf(TaintKind kind) { kind instanceof ExternalStringDictKind }

    override string toString() { result = "dict taint source" }
}

class ExceptionInfoSource extends TaintSource {
    ExceptionInfoSource() { this.(NameNode).getId() = "TAINTED_EXCEPTION_INFO" }

    override predicate isSourceOf(TaintKind kind) { kind instanceof ExceptionInfo }

    override string toString() { result = "Exception info source" }
}

class ExternalFileObjectSource extends TaintSource {
    ExternalFileObjectSource() { this.(NameNode).getId() = "TAINTED_FILE" }

    override predicate isSourceOf(TaintKind kind) { kind instanceof ExternalFileObject }

    override string toString() { result = "Tainted file source" }
}
