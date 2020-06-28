%ifidn __OUTPUT_FORMAT__, macho32
%include  '../util-macho32.mac'
%elifidn __OUTPUT_FORMAT__, macho64
%include  '../util-macho64.mac'
%elifidn __OUTPUT_FORMAT__, elf64
%include  '../util-elf64.mac'
%endif